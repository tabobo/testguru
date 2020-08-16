document.addEventListener('turbolinks:load', function() {
  var progressBar = document.getElementById('progress_bar');
  var percent = progressBar.dataset.valuenow;
  document.querySelector(".progress-bar").style.width = percent + "%";
})






  

  