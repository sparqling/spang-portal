$(document).ready(function() {
    let textArea = document.getElementById("code");
    let originalValue = textArea.value;
    
    let editor = CodeMirror.fromTextArea(textArea, {
        mode: "application/sparql-query",
        matchBrackets: true,
        autoCloseBrackets: true,
        lineNumbers: true,
        sparqlSupportAutoComp: true,
        scrollbarStyle: "null",
        extraKeys: {
          "Tab": function (instance) {
            return false;
          }, "Ctrl-Space": function (instance) {
            return false;
          }
        }
    });
    const historyTraversal = event.persisted ||
      ( typeof window.performance != "undefined" &&
        window.performance.navigation.type === 2 );
    if ( !historyTraversal ) {
      editor.setValue(originalValue);
    }
    let endpoint = $('#code').data('endpoint');
    if (endpoint == "https://query.wikidata.org/") {
        $('#submit_button_query').on('click',
            function () {
                window.location.assign(endpoint + '#' + encodeURIComponent(editor.getValue()))
            }
        );
    } else {
        $('#submit_button_query').on('click',
            function () {
                window.location.assign(endpoint + '?query=' + encodeURIComponent(editor.getValue()));
            }
        );
    }
});