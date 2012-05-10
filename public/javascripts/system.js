function initialize_css3(v_elements) {
	
	if (typeof(v_elements)=="undefined") v_elements = ".css3, .btn, .shadowed, .rounded";
	
	if (window.PIE) {

		$(v_elements).each(function() {
			PIE.attach(this);
		});
	}	
}


// #### NAVIGATION MENU
function initialize_navigation_menu() {

	if ($("#navigation_menu").length<=0) return false;
	
	$("#navigation_menu li").hover(function() {
		$(this).removeClass("hovered").addClass("hovered");
	},function() {
		$(this).removeClass("hovered");
	});
	
	if ($("#navigation_menu").attr("alt").indexOf("centered")>=0) {
		var navigation_menu_width = $("#navigation_menu").width();
		$("#navigation_menu").css("left","50%");
		$("#navigation_menu").css("margin-left",parseInt(-(navigation_menu_width/2))+"px");
	}
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
	$('span[title]').tooltip({ 'fade':250, 'showURL':false });		
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



function set_focus_blur(_control) {
	
	if ($(_control)) {
		
		if ($(_control).val().length<=0) 
			$(_control).val($(_control).attr("title"));
		
		$(_control).focus(function() {
			if ($(this).val() == $(this).attr("title"))
				$(this).val("");
		});
		$(_control).blur(function() {
			if ($(this).val() == "")
				$(this).val($(this).attr("title"));
		});
	}
	
}

function navigator_is_ie() {	
	if (navigator.appName == 'Microsoft Internet Explorer')
		return true;
	else
		return false
}

function trim(myString) {
	return myString.replace(/^\s+/g,'').replace(/\s+$/g,'')
} 

function toggle_display(v_element) {
	
	if (!$("#"+v_element)) return false;
	
	if ($("#"+v_element).css("display")=="none")
		$("#"+v_element).fadeIn("fast");
	else
		$("#"+v_element).hide();
}

function set_tab(v_tab_button, v_tab_index, flag_resize) {
	
	//try {
		
		if (typeof(v_tab_button)=="undefined") return false;
		if (typeof(v_tab_index)=="undefined") v_tab_index = "tab_index";
		if (typeof(flag_resize)=="undefined") flag_resize = true;
		
		var v_prefix_tab = "tab_";	
		var v_prefix_container = "container_";
		
		var v_id = v_tab_button.id;
		if (!(v_id.substr(0, v_prefix_tab.length) == v_prefix_tab)) return false;
		
		var v_index = v_id.substr(v_prefix_tab.length, v_id.length-v_prefix_tab.length); // retrieve the tab index
		if (!isNumeric(v_index)) return false;

		var v_container_id = v_prefix_container+v_index;

		var v_parent1 = $(v_tab_button).parent();
		var v_parent2 = $(v_parent1).parent();
		var v_tabcontrol_id = $(v_parent2).attr("id"); 					// retrieve the tabcontrol container						
		
		$("#"+v_tabcontrol_id +" .tabs .tab").each(function() {

			var v_parent_dummy1 = $(this).parent();
			var v_parent_dummy2 = $(v_parent_dummy1).parent();						
			if ($(v_parent_dummy2).attr("id") == v_tabcontrol_id) {
				$(this).removeClass().addClass("tab");
			}			
			
		});
		
		$(v_tab_button).addClass("selected");	
		
		$("#"+v_tabcontrol_id +" .containers .container").each(function() {
						
			var v_parent_dummy1 = $(this).parent();
			
			if (v_parent_dummy1) {				
				
				var v_parent_dummy2 = $(v_parent_dummy1).parent();
				
				if (v_parent_dummy2) {
					
					if ($(v_parent_dummy2).attr("id") == v_tabcontrol_id) {
												
						if ($(this).attr("id") == v_container_id) {
							$(this).fadeIn("fast");
						}else {
							$(this).removeClass().addClass("container");
							$(this).hide();
						}
					}
				}
			}
		});
						
		if ($("#"+v_tab_index)) $("#"+v_tab_index).val(v_index);				

		if (flag_resize)
			init_tab(v_tab_button.offsetParent.offsetParent);
		
	//}catch(err){ catch_error("set_tab",err); }
}

function init_tab(tabs_control) {
	
	try {
		
		if (typeof(tabs_control) == "string")
			tabs_control_id = tabs_control;
		else {
			if (!tabs_control.id) return false;
			tabs_control_id = tabs_control.id;
		}
		
		v_tabs_height = $("#"+tabs_control_id+" .tabs").height();
		v_height = $("#"+tabs_control_id).height();	
		v_final_height = parseInt(v_height) - parseInt(v_tabs_height)-5;
		if (v_final_height>0)
			$("#"+tabs_control_id+" .containers").css("height",v_final_height+"px");					
		
	}catch(err) { }
}


//____GOOGLE MAP FUNCTIONS__________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
function set_google_map(v_title, v_content, v_address, v_lat_dummy, v_lng_dummy, zoom, div_container, zoom_max, icon, flag_show_window) {

	try {
			
		var zoom_default = 6;
		var zoom_max_default = 8;
		var div_container_default = "google_map_container";
		var icon_default = "http://www.samnaka.fr/prod/google_map_icons/default.png";
		
		if (typeof(div_container)=="undefined") div_container = div_container_default;
		if (typeof(zoom)=="undefined") zoom = zoom_default;
		if (typeof(zoom_max)=="undefined") zoom_max = zoom_max_default;
		if (typeof(icon)=="undefined") icon = icon_default;
		if (typeof(flag_show_window)=="undefined") flag_show_window = true;				
		
		if (!doc_id(div_container)) return false;		
		
		if ((typeof(v_lat_dummy)=="undefined")||(typeof(v_lng_dummy)=="undefined")) {
				
			//alert(v_address);
			// address resolution needed
			var geocoder = new google.maps.Geocoder();	
			
			geocoder.geocode(					
				{ address: v_address }, 					
					
				function(results, status) {
								
					if (status == google.maps.GeocoderStatus.OK && results.length) {																			
						v_lat = results[0].geometry.location.lat();
						v_lng = results[0].geometry.location.lng()	
						display_contact_google_map(v_lat, v_lng, zoom, zoom_max, div_container, v_title, v_content, icon);													
					}		
				}
			);
			
		}else {
			// directly display the map
			display_contact_google_map(v_lat_dummy, v_lng_dummy, zoom, zoom_max, div_container, v_title, v_content, icon, flag_show_window);													
		}
		
	}catch(err) {
		
		catch_error("set contact google map",err);
	}
}

function display_contact_google_map(v_lat, v_lng, zoom, zoom_max, div_container, v_title, v_content, icon, flag_show_window) {
	
	try {
		
		
		// initialize the google map					
		var myOptions = {		
					  mapTypeControl: false,
			zoom: parseInt(zoom),
			center: new google.maps.LatLng(v_lat, v_lng),
			mapTypeId: google.maps.MapTypeId.ROADMAP


		};
		
		var map = new google.maps.Map(doc_id(div_container), myOptions);			// create the map

		// adding the company marker
		var v_marker = new google.maps.Marker({
			position: new google.maps.LatLng(v_lat, v_lng),
			title:v_title,
			map:map,
			icon: icon
		});  		
				
		if (flag_show_window) {
			
			infowindow = new google.maps.InfoWindow({
				content: v_content
			});
			infowindow.open(map ,v_marker);			
		}	
		
		google.maps.event.addListener(v_marker, 'click', function() {	  	

			infowindow = new google.maps.InfoWindow({
				content: v_content
			});
			infowindow.open(map ,v_marker);			

			map.setCenter(v_marker.position);
			map.setZoom(parseInt(zoom_max));
		});		
		
		
	}catch(err) {
		
		catch_error("display contact google map",err);
	}	
}


// this function check the global website search : not equal to the default search string, not empty...
function check_search(v_search_string, v_search_control) {
	
	if (typeof(v_search_control)=="undefined") v_search_control = "search";
	if (!$("#"+v_search_control)) return false;
	if ($("#"+v_search_control).val().toLowerCase() == v_search_string.toLowerCase()) return false;
	if ($("#"+v_search_control).val().length<=0) return false;
	
	return true;
}
function set_lang(v_lang, v_path) {
	
	if (typeof(v_path)=="undefined") v_path = "";
	
	v_return_code = ajax(v_path+"kernel/ajax/lang.php?lang=" +escape(v_lang));
	if (v_return_code == "0") 
		window.location.reload(true);
	else
		alert("Une erreur s'est produite :\r\n" +v_return_code);
}


function refresh_antispam(img_antispam, id_antispam) {

	if (typeof(img_antispam) == "undefined") img_antispam = "img.antispam.png";
	if (typeof(id_antispam) == "undefined") id_antispam = "img_antispam";
		
	var rnumber = Math.floor(Math.random()*9999999);	
	
	if (doc_id(id_antispam))	doc_id(id_antispam).src = img_antispam +"?r=" +rnumber;
}

/* Catch an error incoming from a try catch */
function catch_error(v_function, v_err) {
		
	alert("An error occured in function [" +v_function +"]\r\n" +v_err.message);
}

function focus_text(v_control,v_text) {
	focus_control_string(v_control, v_text);
}
function focus_control_string(v_control, v_text) {
	
	if (typeof(v_control) == "undefined") return false;
	if (typeof(v_text) == "undefined") return false;
	if (v_text.length<=0) return false;
	
	if (v_control.value.toUpperCase() == v_text.toUpperCase()) v_control.value = "";
}

function blur_text(v_control, v_text) {
	blur_control_string(v_control, v_text);
}
function blur_control_string(v_control, v_text) {

	if (typeof(v_control) == "undefined") return false;
	if (typeof(v_text) == "undefined") return false;
	if (v_text.length<=0) return false;

	if (v_control.value.length<=0) v_control.value = v_text;

}

/* Add an event listener to the specified object, and map it with the specified function */
function addEventListener2(obj,event,fct){
	
	try {
		
		if (obj == null) return false;
		
	     if(obj.attachEvent)
	        obj.attachEvent('on' + event,fct);
	     else
	        obj.addEventListener(event,fct,true);
	}catch(err) {
	}
}

function doc_id(v_element) {
	
	return document.getElementById(v_element);
}

function isNumeric(v_string) {
	
	try {		
		
		if (typeof(v_string) == "undefined") return false;
		v_string = v_string.toString();
				
		if (v_string.length<=0) return false;
		
		var ValidChars = "-0123456789.";
		var IsNumber=true;
		var Char;
	
		for (i=0; i<v_string.length && IsNumber == true; i++) {
			
			Char = v_string.charAt(i);
			if (ValidChars.indexOf(Char) == -1) IsNumber = false;
		}
		
		return IsNumber;
		
	}catch(err) {
		
		catch_error("isNumeric",err);
	}
} 
function isEmail(String){
	
	try {
		
		emailRegExp = /^[_a-z0-9A-Z-]+(\.[_a-z0-9A-Z-]+)*@[a-z0-9A-Z-]+(\.[a-z0-9A-Z-]+)*(\.([a-zA-Z]){2,4})$/
		return emailRegExp.test(String);
		
	}catch(err) {
		
		catch_error("isEmail",err);
	}
}

function ajax(v_file) { 
	
	try {
			
		if(window.XMLHttpRequest) // FIREFOX
		  	xhr_object = new XMLHttpRequest();
		else if(window.ActiveXObject) // IE
		  	xhr_object = new ActiveXObject("Microsoft.XMLHTTP");
		else
			return(false);
						
		xhr_object.open("GET", v_file, false);
		xhr_object.send(null);
		if(xhr_object.readyState == 4) return(xhr_object.responseText);
		else return(false);
			
	}catch(err) {
		
		catch_error("ajax",err);
	}			
}

function fill_div(div_id, v_httpFile) { 	
		
	try {
		
		if(window.XMLHttpRequest) // FIREFOX
		  	xhr_object = new XMLHttpRequest();
		else if(window.ActiveXObject) // IE
		  	xhr_object = new ActiveXObject("Microsoft.XMLHTTP");
		else
			return(false);
						
		xhr_object.open("GET", v_httpFile, false);
		xhr_object.send(null);
		if(xhr_object.readyState == 4) {
			if (document.getElementById(div_id))
				document.getElementById(div_id).innerHTML = xhr_object.responseText;				
				
				try {
					
					var AllScripts=xhr_object.responseText.extractTags("script");
					//AllScripts.forEach(function (v) { eval(v); } )
					myEach(AllScripts, function(v) { eval(v); });
					
				} catch (ex) {}
					
								
		}
		else 
			return(false);
			
	}catch(err) {
		
		catch_error("fill_div",err);
	}		
}
String.prototype.extractTags=function(tag) {
	
    var matchAll = new RegExp('(?:<'+tag+'.*?>)((\n|\r|.)*?)(?:<\/'+tag+'>)', 'img');
    var matchOne = new RegExp('(?:<'+tag+'.*?>)((\n|\r|.)*?)(?:<\/'+tag+'>)', 'im');
    return myMap( (this.match(matchAll) || []), function(scriptTag) {   return (scriptTag.match(matchOne) || ['', ''])[1]; });
}
function myEach(myElement, delegate, ownpropertiesonly) {
	
	try {

		if (typeof(delegate)=="function") {
			
			if (myElement instanceof Array && typeof(ownpropertiesonly)=="undefined") {
				ownpropertiesonly=true;
			}
			for (key in myElement) {
				var ok = (!ownpropertiesonly);
				if (!ok) {
					try {
					    ok=myElement.hasOwnProperty(key)
					} catch (ex) {}
				}
				if (ok) {
					try { delegate(myElement[key], key, myElement) } catch(e) {
					    // ...
					}
				}
			}
		}

		return false;
	}catch(err) { }	
	
}
function myMap(myElement, iterator) {

	var results = [];
	myEach(myElement,function(value, index) { results.push(iterator(value, index)); });
	return results;
}