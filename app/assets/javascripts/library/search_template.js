$(document).ready(function() {
  $('#search_input').on('input', (e) =>
    {
      $.get('/api/incremental_search',
        { 'keyword': e.target.value },
        (res) => {
          console.log( res.map((name) => `<option>${name}</option>`).join())
          $('#search_keyword_list')[0].innerHTML = res.map((name) => `<option>${name}</option>`).join('')
        }
      );
    }  
  );
});