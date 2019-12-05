function tinymce_init_callback(editor) {
    editor.remove();
    editor = null;

    tinymce.init({
        menubar: true,
        selector: 'textarea.richTextBox',
        skin_url: $('meta[name="assets-path"]').attr('content') + '?path=js/skins/voyager',
        min_height: 600,
        resize: 'vertical',
        plugins: 'print preview searchreplace autolink directionality visualblocks visualchars  image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern help code textcolor emoticons tabfocus colorpicker',
        extended_valid_elements: 'input[id|name|value|type|class|style|required|placeholder|autocomplete|onclick]',
        file_browser_callback: function (field_name, url, type, win) {
            $('#upload_file').trigger('click');
        },
        toolbar: 'formatselect | bold italic strikethrough | forecolor backcolor | link image media | alignleft aligncenter alignright alignjustify  | numlist bullist outdent indent | ltr rtl | removeformat | code | emoticons | colorpicker',
        convert_urls: false,
        image_caption: true,
        image_title: true,
        content_style: '.mce-annotation { background: #fff0b7; } .tc-active-annotation {background: #ffe168; color: black; }',
        external_plugins: {
            'print': '/tinymce/plugins/print/plugin.js',
            'preview': '/tinymce/plugins/preview/plugin.js',
            'searchreplace': '/tinymce/plugins/searchreplace/plugin.js',
            'directionality': '/tinymce/plugins/directionality/plugin.js',
            'visualchars': '/tinymce/plugins/visualchars/plugin.js',
            'visualblocks': '/tinymce/plugins/visualblocks/plugin.js',
            'autolink': '/tinymce/plugins/autolink/plugin.js',
            'media': '/tinymce/plugins/media/plugin.js',
            'template': '/tinymce/plugins/template/plugin.js',
            'codesample': '/tinymce/plugins/codesample/plugin.js',
            'charmap': '/tinymce/plugins/charmap/plugin.js',
            'pagebreak': '/tinymce/plugins/pagebreak/plugin.js',
            'hr': '/tinymce/plugins/hr/plugin.js',
            'anchor': '/tinymce/plugins/anchor/plugin.js',
            'nonbreaking': '/tinymce/plugins/nonbreaking/plugin.js',
            'insertdatetime': '/tinymce/plugins/insertdatetime/plugin.js',
            'toc': '/tinymce/plugins/toc/plugin.js',
            'advlist': '/tinymce/plugins/advlist/plugin.js',
            'wordcount': '/tinymce/plugins/wordcount/plugin.js',
            'imagetools': '/tinymce/plugins/imagetools/plugin.js',
            'textpattern': '/tinymce/plugins/textpattern/plugin.js',
            'help': '/tinymce/plugins/help/plugin.js',
            'autoresize': '/tinymce/plugins/autoresize/plugin.js',
            'bbcode': '/tinymce/plugins/bbcode/plugin.js',
            'code': '/tinymce/plugins/code/plugin.js',
            'colorpicker': '/tinymce/plugins/colorpicker/plugin.js',
            'emoticons': '/tinymce/plugins/emoticons/plugin.js',
            'image': '/tinymce/plugins/image/plugin.js',
            'link': '/tinymce/plugins/link/plugin.js',
            'lists': '/tinymce/plugins/lists/plugin.js',
            'textcolor': '/tinymce/plugins/textcolor/plugin.js',
            'tabfocus': '/tinymce/plugins/tabfocus/plugin.js',
            'table': '/tinymce/plugins/table/plugin.js',
        }
    })
}
