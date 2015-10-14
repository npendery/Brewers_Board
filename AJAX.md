app.js

// $(".delete").click(function(event){
//     event.preventDefault();
//     var url = $(this).attr('href');
//     $.ajax({
//         type: "POST",
//         url: url,
//         dataType: "json",
//         data: {"_method":"delete"},
//     }).done(function() {
//       var recipeId = ???
//       var link = "<a href'...." + recipeId + "/reviews/new'> link text </a>";
//       $(".recipe-review").append("<div class='row recipe-review'>" + link + "</div>");
//       // delete this particular review
//     });
// });

reviews_controller

# respond_to do |format|
#   format.json {
#     render json: @recipe
#   }
# end
