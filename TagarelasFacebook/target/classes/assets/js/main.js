// Cancela a edição da imagem
function cancelar() {
	// Esconde a div
	$('#cortar_imagem').hide();
	
	// Zera os dados do formulário de corte da imagem
	$('#x').val(null);
	$('#y').val(null);
	$('#largura').val(null);
	$('#altura').val(null);
	$('#escala').val(null);
	
	// Remove as ações dos botões de edição da imagem
	$('#girar_para_esquerda').unbind('click');
	$('#girar_para_direita').unbind('click');
	$('#aumentar_zoom').unbind('click');
	$('#diminuir_zoom').unbind('click');

	var inputFile = $('#foto_selecionada');
	inputFile.replaceWith(inputFile = inputFile.clone(true));
};

function fileSelectHandler() {

	// Pega o arquivo selecionado
	var oFile = $('#foto_selecionada')[0].files[0];

	// Esconde erros que tenham ocorrido
	$('.erro').hide();

	// Verifica o tipo do arquivo (são permitidos arquivos jpg e png)
	var rFilter = /^(image\/jpeg|image\/png)$/i;
	if (!rFilter.test(oFile.type)) {
		$('.mensagem').html(
				'Por favor selecione um arquivo v\u00e1lido (jpg ou png).')
				.show();
		return;
	}

	// Verifica o tamanho do arquivo
	if (oFile.size > 3072 * 1024) {
		$('.mensagem').html(
				'Por favor selecione uma foto com no m\u00e1ximo 3MB.');
		return;
	}

	// Elemento preview
	var oImage = document.getElementById('preview');

	// Prepara o HTML5 FileReader
	var oReader = new FileReader();
	oReader.onload = function(e) {

		// e.target.result contém o DataURL que pode ser usado como fonte da imagem
		oImage.src = e.target.result;

		// Exibe a div cortar_imagem
		$('#cortar_imagem').fadeIn(500);

		var picture = $('#preview');

		picture.one('load', function() {
			
			picture.guillotine('remove');

			picture.guillotine({
				width: 400,
				height: 400,
				eventOnChange: 'guillotinechange'
			});

			// Carrega dados iniciais para ajuste da imagem
			var data = picture.guillotine('getData');
			for (var key in data) {
				$('#' + key).val(data[key]);
			}

			// Aplica as funções nos botões
			$('#girar_para_esquerda').click(function() {
				picture.guillotine('rotateLeft');
			});

			$('#girar_para_direita').click(function() {
				picture.guillotine('rotateRight');
			});

			$('#aumentar_zoom').click(function() {
				picture.guillotine('zoomIn');
			});

			$('#diminuir_zoom').click(function() {
				picture.guillotine('zoomOut');
			});

			// Atualiza os dados para ajuste da imagem de acordo com as mudanças realizadas
			picture.on('guillotinechange', function(ev, data, action) {
				data.scale = parseFloat(data.scale.toFixed(4));
				for (var key in data) {
					$('#' + key).val(data[key]);
				}
			});
		});

		if (picture.prop('complete'))
			picture.trigger('load')

	};

	oReader.readAsDataURL(oFile);
}