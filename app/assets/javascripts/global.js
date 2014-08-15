$(function(){
  // dismiss notices automatically after 10 secs
  setTimeout(function(){
    $(".alert").fadeOut("slow", function(){ $(this).remove(); })
  }, 10000);

  $(".dismiss-notice").on('click', function(){
    $(this).closest(".alert").fadeOut("slow", function(){
      $(this).remove();
    });
  });
});
