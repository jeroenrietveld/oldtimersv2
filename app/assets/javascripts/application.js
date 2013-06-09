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
//= require turbolinks
//= require_tree .

function test(link, association, content) {
	var value = $(".label-input").val();

	if(value) {
	  var new_id = new Date().getTime();
	  var regexp = new RegExp("hidden_label", "g");
		content = content.replace(regexp, new_id);

		$(".label-input").val("");
	  content = $(content).val(value);

	  $(link).parent(".labels").append(content);

	  $(".added-labels").append('<div class="span6 pushpin"><img src="/assets/pushpin.png" height="12" width="12" />asd</div><div class="span3 remove-label"><img class="pull-right" src="/assets/remove.png" height="20" width="20" /></div>');
	}
}