function animate( $that, percentage ) {
  if ( !$that.hasClass('fill') ) return;
  $that.removeClass('fill');

  percentage = (100 - percentage) || 0;
  var percentage_initial = 100,
      percentage_current = percentage_initial,
      interval = 0.5;

  var interval_gradient = setInterval(function(){
    $that.css(
      'background',
      'linear-gradient(#a0c884 '+percentage_current+'%,#426e1f '+percentage_current+'%)'
    );
    percentage_current -= interval;
    if(percentage_current <= percentage) clearInterval(interval_gradient);
  }, 5);

  $that.addClass('filled');
};

$('.fill').on('click', function() {
  var $that = $(this);
  var percentage = $that.attr('data-fill');
  setTimeout(function(){
    animate( $that, percentage )
  }, 400);
});
