$(".rating").on("click", "label", function(){
  $label = $(this);
  $label.closest(".rating").find("label").removeClass("active-label");
  $label.addClass("active-label");
  $label.prevAll("label").addClass("active-label");
});

$(".rating").on("mouseover", "label", function(){
  $label = $(this);
  $label.addClass("active-hover");
  $label.prevAll("label").addClass("active-hover");
  $label.closest(".rating").find("label").removeClass("active-label");
  $label.addClass("active-label");
  $label.prevAll("label").addClass("active-label");
});

$(".rating").on("mouseleave", "label", function(){
  $label = $(this);
  $label.closest(".rating").find("label").removeClass("active-hover");
});
