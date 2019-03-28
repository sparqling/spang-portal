$(document).ready(function() {
    var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
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
    var endpoint = $('#code').data('endpoint');
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