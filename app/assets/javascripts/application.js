// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require select2
//= require_tree .

$(document).ready(function() {
	$(".label-input").keypress(function(e) {
		if(e.which == 13) {
			e.preventDefault();
			$(".add-label").click();
		}
	});

	$(".register-user").click(function(){
		$(".register-user .select input").prop("checked", true);
		$(".register-company .select input").prop("checked", false);
	});

	$(".register-company").click(function(){
		$(".register-company .select input").prop("checked", true);
		$(".register-user .select input").prop("checked", false);
	});

	$("#categories_select").select2({
  	width: 'resolve',
  	placeholder: 'Selecteer passende categorieën'
  });

  $(".actions div").hover(function(){
  	if($(this).attr("data-clickable") || $(this).attr("data-hoverable")) {
    	var img = $(this).children('img').attr('src').match(/(\w+).png/)[1];
    	$(this).find('img').attr('src', "/assets/" + img + "_highlight.png");
    }
  }, function(){
  	if($(this).attr("data-clickable") || $(this).attr("data-hoverable")) {
	    var img = $(this).find('img').attr('src').split('_highlight.png')[0];
	    $(this).find('img').attr('src', img + ".png");
	  }
  });

  $(".like").click(function() {
  	if($(this).attr("data-clickable")) {
			if (!window.location.origin) window.location.origin = window.location.protocol+"//"+window.location.host;

			var id = $(this).parent(".actions").data('id');

			var self = $(this);

			$.post(window.location.origin+"/answers/"+id+"/like", function(data) {
				if(data == true) {
					self.removeAttr("data-clickable");
					$(this).find('img').attr('src', '/assets/thumbs_up_highlight.png');
				}
			});
		}
  });
  
  $('.dropdown-menu').find('form').click(function (e) {
    e.stopPropagation();
  });
});

function test(link, association, content) {
	var value = $(".label-input").val();

	if(value) {
	  var new_id = new Date().getTime();
	  var regexp = new RegExp("hidden_label", "g");
		content = content.replace(regexp, new_id);

		$(".label-input").val("");
	  content = $(content).val(value);

	  $(link).parent(".labels").append(content);

	  $(".added-labels").append('<div class="row added-label"><div class="span6 pushpin"><img src="/assets/pushpin.png" height="12" width="12" />'+value+'</div><div class="span3 remove-label"><img class="pull-right" src="/assets/remove.png" height="20" width="20" /></div></div>');
	}
}