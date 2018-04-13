/*CREATED: Sam Wolfe 4/12/2018

Description: Javascript code for the rotating icons on the homepage

*/

$(function(){
  $("#bandCard").on({
    mouseenter: function() { 
      if ($("#recordImage").getRotateAngle() >= 3600){
        $("#recordImage").rotate({angle: 0})
      }
      $("#recordImage").rotate({
        animateTo:3600,
        duration: 60000
      })
    },
    mouseleave : function() { 
      $("#recordImage").rotate({
        animateTo: 0,
        duration: 300
      })      
    }
  });

  $("#businessCard").on({
    mouseenter: function() { 
      if ($("#djImage").getRotateAngle() >= 3600){
        $("#djImage").rotate({angle: 0})
      }
      $("#djImage").rotate({
        animateTo:3600,
        duration: 60000
      })
    },
    mouseleave : function() { 
      $("#djImage").rotate({
        animateTo: 0,
        duration: 300
      })        
    }
  });
});