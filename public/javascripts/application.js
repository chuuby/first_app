//________global functions________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
$(document).ready(function(){

	initialize_tooltips();

	initialize_textbox_blur_focus();

	initialize_lazyloads();

	initialize_accordion();

	initialize_slider();

	initialize_summary();

	initialize_scroll_anchors();

	if ($("#btn_rappel_ok").length>0) {

		$("#btn_rappel_ok").click(function() {

			var surname = $("#surname").val();
			var surname_title = $("#surname").attr("title");
			var phone = $("#phone").val();
			var phone_title = $("#phone").attr("title");
			if (surname==surname_title) surname = "";
			if (phone==phone_title) phone = "";

			if ((surname.length<=0)||(phone.length<=0)) {
				alert("Merci de renseigner votre Nom et Num\351ro de t\351l\351phone");
				return false;
			}
			if ($("#f_rappel")) $("#f_rappel").submit();
		});
	}

	init_css3();
});

function init_css3(v_elements) {

	if (typeof(v_elements)=="undefined") v_elements = ".css3, .btn, .shadowed, .rounded, .input-btn, .input-txt, .input-txtl";

	if (window.PIE) {
		$(v_elements).each(function() {
			PIE.attach(this);
		});
	}
}


function initialize_scroll_anchors() {

	$(".scroll_anchor").click(function(event){
		event.preventDefault();
		var full_url = this.href;
		var parts = full_url.split("#");
		var trgt = parts[1];
		var target_offset = $("#"+trgt).offset();
		var target_top = target_offset.top;
		$('html, body').animate({scrollTop:target_top}, 500);
	});
}

function initialize_summary() {

	$(".summary_tag").each(function() {

		$(this).click(function(evt) {

			evt.preventDefault();

			$(".summary_tag").removeClass("selected");
			$(this).removeClass("selected").addClass("selected");
			var uid = $(this).attr("id");
			if (uid.length>0) {

				var summary_display_mode = $("#summary_display_mode").val();

				if (summary_display_mode == "summary") {
					if ($("#summary_container_"+uid).length>0) {
						$(".summary_container").hide();
						$(".summary_container").removeClass("selected");
						$("#summary_container_"+uid).fadeIn("fast");
						$("#summary_container_"+uid).addClass("selected");
					}
				}else {

					var target_offset = $("#"+uid).offset();
					var target_top = target_offset.top;
					//goto that anchor by setting the body scroll top to anchor top
					$('html, body').animate({scrollTop:target_top}, 500);

					/*alert("goto : "+uid);
					document.location.hash = uid;*/
				}
			}
		});
	});

	if ( ($("#summary_display_mode_normal").length>0) && ($("#summary_display_mode_summary").length>0) ){
		$("#summary_display_mode_normal").click(function() {
			$(this).hide();
			$("#summary_display_mode_summary").fadeIn("fast");
			if ($("#summary_display_mode").length>0) $("#summary_display_mode").val("normal");
			$(".summary_container").hide();
			$("#normal_container").fadeIn("fast");
		});
		$("#summary_display_mode_summary").click(function() {
			$(this).hide();
			$("#summary_display_mode_normal").fadeIn("fast");
			if ($("#summary_display_mode").length>0) $("#summary_display_mode").val("summary");
			$("#normal_container").hide();
			$(".summary_container").filter(".selected").fadeIn("fast");
		});
	}
}
// #### SLIDER ####
function initialize_slider() {

	$("#slider").easySlider({
		prevText: '',
		nextText:'',
		pause: 7000,
		auto:true,
		continuous:true,
		hoverpause: true
	});
}

// #### ACCORDION ####
function initialize_accordion() {

	var menu_position = -1;
	if ($("#menu_position")) menu_position = $("#menu_position").val();
	menu_position = Number(menu_position)-1;

	if ($("#menu_"+menu_position)) {
		var menu_class = $("#menu_"+menu_position).attr("class");
		if (typeof(menu_class)!="undefined") {
			if (menu_class.indexOf("h3_link")>=0)
				menu_position = -1;
		}
	}

	$("#accordion div").css("display","block");
	if ($( "#accordion")) {
		if (menu_position!=-1) {
			$( "#accordion").accordion({
				autoHeight:true,
				active: menu_position,
				icons: false
			});
		}else {
			$( "#accordion").accordion({
				autoHeight:true,
				active: -1,
				icons: false
			});
		}
	}
	$("#accordion .h3_link").unbind("click");
	$("#accordion div").each(function() {
		if ($(this).children().length<=0) {
			$(this).css("height","2px");
			$(this).css("background","#929090");

		}
	});


}

// #### TEXTBOX BLUR/FOCUS
function initialize_textbox_blur_focus() {

	// #### set textbox blur/focus style
	$('input[type=text].textbox, textarea.textbox').focus(function() {
		$(this).addClass("textbox_focus");
	});
	$('input[type=text].textbox, textarea.textbox').blur(function() {
		$(this).removeClass("textbox_focus");
	});

	$('input[type=text].focusable').focus(function() {
		if ($(this).attr("title").length>0)
			if ($(this).val() == $(this).attr("title"))
				$(this).val("");
	});

	$('input[type=text].focusable').blur(function() {
		if ($(this).attr("title").length>0)
			if ($(this).val() == "")
				$(this).val($(this).attr("title"));
	});

}

// #### TOOLTIPS ####
function initialize_tooltips() {

	$('a[title]').tooltip({ 'fade':250, 'showURL':false });
	$('label[title]').tooltip({ 'fade':250, 'showURL':false });
}

// #### PICTURE LAZYLOADS ####
function initialize_lazyloads() {

	// #### pictures lazyload fadein effects
	$("img").each(function() {
		if (typeof($(this).attr("class"))!="undefined") {
			if ($(this).attr("class").indexOf("none")<0)
				$(this).lazyload({
					effect      : "fadeIn"
				});
		}
	});

}


function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id));
}



function calcul(){
    var tempht=0;
    var temptva=0;
    var tempttc=0;

for(i=1;i<document.forms.length;i++){
    //var tva = document.forms[i].elements[1].value;
    var prix = document.forms[i].elements[2].value;
    var qte =  document.forms[i].elements[3].value;

    qte = (qte == '') ? 0 : qte;
    prix = (prix == '') ? 0 : prix;

    //Montant HT du champ
    document.forms[i].elements[4].value=qte*prix

    //Montant TVA du champ
    document.forms[i].elements[5].value = document.forms[i].elements[4].value * document.forms[i].elements[1].value/100

    //Montant TVA du champ
    document.forms[i].elements[6].value = document.forms[i].elements[5].value*1 + document.forms[i].elements[4].value*1

    tempht += document.forms[i].elements[4].value*1
    temptva += document.forms[i].elements[5].value*1
    tempttc += document.forms[i].elements[6].value*1
}
    //Montant HT de la facture
    document.forms[0].elements[3].value = tempht
    document.forms[0].elements[4].value = temptva
    document.forms[0].elements[5].value = tempttc

 }