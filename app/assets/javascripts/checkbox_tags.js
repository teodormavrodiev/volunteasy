$(document).ready(function(){
 $(".check_boxes_submit").change(function(){
   var check_box = $(this).val();
   var checked = $(this).is(':checked');
   var gist = JSON.stringify({
     "tag_id": check_box,
     "is_checked": checked
   });
   $.ajax({
          type: "get",
          url: "/sava_data",
          success: function(result){
            src.parents('form:first').submit();
        }});
    });
});

