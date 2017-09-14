!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):"object"==typeof module&&module.exports?module.exports=function(t,i){return void 0===i&&(i="undefined"!=typeof window?require("jquery"):require("jquery")(t)),e(i)}:e(window.jQuery)}(function(e){e.extend(e.FE.POPUP_TEMPLATES,{"file.insert":"[_BUTTONS_][_UPLOAD_LAYER_][_PROGRESS_BAR_]"}),e.extend(e.FE.DEFAULTS,{fileUploadURL:"https://i.froala.com/upload",fileUploadParam:"file",fileUploadParams:{},fileUploadToS3:!1,fileUploadMethod:"POST",fileMaxSize:10485760,fileAllowedTypes:["*"],fileInsertButtons:["fileBack","|"],fileUseSelectedText:!1}),e.FE.PLUGINS.file=function(t){function i(){var e=t.$tb.find('.fr-command[data-cmd="insertFile"]'),i=t.popups.get("file.insert");if(i||(i=y()),o(),!i.hasClass("fr-active")){t.popups.refresh("file.insert"),t.popups.setContainer("file.insert",t.$tb);var r=e.offset().left+e.outerWidth()/2,n=e.offset().top+(t.opts.toolbarBottom?0:e.outerHeight());t.popups.show("file.insert",r,n,e.outerHeight())}}function r(){var e=t.popups.get("file.insert");e||(e=y()),e.find(".fr-layer.fr-active").removeClass("fr-active").addClass("fr-pactive"),e.find(".fr-file-progress-bar-layer").addClass("fr-active"),e.find(".fr-buttons").hide(),n(t.language.translate("Uploading"),0)}function o(e){var i=t.popups.get("file.insert");i&&(i.find(".fr-layer.fr-pactive").addClass("fr-active").removeClass("fr-pactive"),i.find(".fr-file-progress-bar-layer").removeClass("fr-active"),i.find(".fr-buttons").show(),e&&(t.events.focus(),t.popups.hide("file.insert")))}function n(e,i){var r=t.popups.get("file.insert");if(r){var o=r.find(".fr-file-progress-bar-layer");o.find("h3").text(e+(i?" "+i+"%":"")),o.removeClass("fr-error"),i?(o.find("div").removeClass("fr-indeterminate"),o.find("div > span").css("width",i+"%")):o.find("div").addClass("fr-indeterminate")}}function a(e){r();var i=t.popups.get("file.insert"),o=i.find(".fr-file-progress-bar-layer");o.addClass("fr-error");var n=o.find("h3");n.text(e),t.events.disableBlur(),n.focus()}function s(e,i,r){t.edit.on(),t.events.focus(!0),t.selection.restore(),t.opts.fileUseSelectedText&&t.selection.text().length&&(i=t.selection.text()),t.html.insert('<a href="'+e+'" id="fr-inserted-file" class="fr-file">'+i+"</a>");var o=t.$el.find("#fr-inserted-file");o.removeAttr("id"),t.popups.hide("file.insert"),t.undo.saveStep(),C(),t.events.trigger("file.inserted",[o,r])}function l(e){try{if(!1===t.events.trigger("file.uploaded",[e],!0))return t.edit.on(),!1;var i=JSON.parse(e);return i.link?i:(c(k,e),!1)}catch(t){return c(x,e),!1}}function f(i){try{var r=e(i).find("Location").text(),o=e(i).find("Key").text();return!1===t.events.trigger("file.uploadedToS3",[r,o,i],!0)?(t.edit.on(),!1):r}catch(e){return c(x,i),!1}}function p(e){var i=this.status,r=this.response,o=this.responseXML,n=this.responseText;try{if(t.opts.fileUploadToS3)if(201==i){var a=f(o);a&&s(a,e,r||o)}else c(x,r||o);else if(i>=200&&i<300){var p=l(n);p&&s(p.link,e,r||n)}else c(w,r||n)}catch(e){c(x,r||n)}}function d(){c(x,this.response||this.responseText||this.responseXML)}function u(e){if(e.lengthComputable){var i=e.loaded/e.total*100|0;n(t.language.translate("Uploading"),i)}}function c(e,i){t.edit.on(),a(t.language.translate("Something went wrong. Please try again.")),t.events.trigger("file.error",[{code:e,message:F[e]},i])}function v(){t.edit.on(),o(!0)}function g(e){if(void 0!==e&&e.length>0){if(!1===t.events.trigger("file.beforeUpload",[e]))return!1;var i=e[0];if(i.size>t.opts.fileMaxSize)return c(P),!1;if(t.opts.fileAllowedTypes.indexOf("*")<0&&t.opts.fileAllowedTypes.indexOf(i.type.replace(/file\//g,""))<0)return c(A),!1;var o;if(t.drag_support.formdata&&(o=t.drag_support.formdata?new FormData:null),o){var n;if(!1!==t.opts.fileUploadToS3){o.append("key",t.opts.fileUploadToS3.keyStart+(new Date).getTime()+"-"+(i.name||"untitled")),o.append("success_action_status","201"),o.append("X-Requested-With","xhr"),o.append("Content-Type",i.type);for(n in t.opts.fileUploadToS3.params)t.opts.fileUploadToS3.params.hasOwnProperty(n)&&o.append(n,t.opts.fileUploadToS3.params[n])}for(n in t.opts.fileUploadParams)t.opts.fileUploadParams.hasOwnProperty(n)&&o.append(n,t.opts.fileUploadParams[n]);o.append(t.opts.fileUploadParam,i);var a=t.opts.fileUploadURL;t.opts.fileUploadToS3&&(a=t.opts.fileUploadToS3.uploadURL?t.opts.fileUploadToS3.uploadURL:"https://"+t.opts.fileUploadToS3.region+".amazonaws.com/"+t.opts.fileUploadToS3.bucket);var s=t.core.getXHR(a,t.opts.fileUploadMethod);s.onload=function(){p.call(s,i.name)},s.onerror=d,s.upload.onprogress=u,s.onabort=v,r(),t.edit.off();var l=t.popups.get("file.insert");l&&l.off("abortUpload").on("abortUpload",function(){4!=s.readyState&&s.abort()}),s.send(o)}}}function h(i){t.events.$on(i,"dragover dragenter",".fr-file-upload-layer",function(){return e(this).addClass("fr-drop"),!1},!0),t.events.$on(i,"dragleave dragend",".fr-file-upload-layer",function(){return e(this).removeClass("fr-drop"),!1},!0),t.events.$on(i,"drop",".fr-file-upload-layer",function(r){r.preventDefault(),r.stopPropagation(),e(this).removeClass("fr-drop");var o=r.originalEvent.dataTransfer;o&&o.files&&(i.data("instance")||t).file.upload(o.files)},!0),t.helpers.isIOS()&&t.events.$on(i,"touchend",'.fr-file-upload-layer input[type="file"]',function(){e(this).trigger("click")}),t.events.$on(i,"change",'.fr-file-upload-layer input[type="file"]',function(){this.files&&(i.data("instance")||t).file.upload(this.files),e(this).val("")},!0)}function m(){o()}function y(e){if(e)return t.popups.onHide("file.insert",m),!0;var i="";i='<div class="fr-buttons">'+t.button.buildList(t.opts.fileInsertButtons)+"</div>";var r="";r='<div class="fr-file-upload-layer fr-layer fr-active" id="fr-file-upload-layer-'+t.id+'"><strong>'+t.language.translate("Drop file")+"</strong><br>("+t.language.translate("or click")+')<div class="fr-form"><input type="file" name="'+t.opts.fileUploadParam+'" accept="/*" tabIndex="-1" aria-labelledby="fr-file-upload-layer-'+t.id+'" role="button"></div></div>';var o='<div class="fr-file-progress-bar-layer fr-layer"><h3 tabIndex="-1" class="fr-message">Uploading</h3><div class="fr-loader"><span class="fr-progress"></span></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-dismiss" data-cmd="fileDismissError" tabIndex="2" role="button">OK</button></div></div>',n={buttons:i,upload_layer:r,progress_bar:o},a=t.popups.create("file.insert",n);return h(a),a}function b(e){t.node.hasClass(e,"fr-file")}function U(i){var o=i.originalEvent.dataTransfer;if(o&&o.files&&o.files.length){var n=o.files[0];if(n&&void 0!==n.type&&n.type.indexOf("image")<0&&(t.opts.fileAllowedTypes.indexOf(n.type)>=0||t.opts.fileAllowedTypes.indexOf("*")>=0)){t.markers.remove(),t.markers.insertAtPoint(i.originalEvent),t.$el.find(".fr-marker").replaceWith(e.FE.MARKERS),t.popups.hideAll();var a=t.popups.get("file.insert");return a||(a=y()),t.popups.setContainer("file.insert",t.$sc),t.popups.show("file.insert",i.originalEvent.pageX,i.originalEvent.pageY),r(),g(o.files),i.preventDefault(),i.stopPropagation(),!1}}}function S(){t.events.on("drop",U),t.events.$on(t.$win,"keydown",function(i){var r=i.which,o=t.popups.get("file.insert");o&&r==e.FE.KEYCODE.ESC&&o.trigger("abortUpload")}),t.events.on("destroy",function(){var e=t.popups.get("file.insert");e&&e.trigger("abortUpload")})}function T(){t.events.disableBlur(),t.selection.restore(),t.events.enableBlur(),t.popups.hide("file.insert"),t.toolbar.showInline()}function C(){var e,i=Array.prototype.slice.call(t.el.querySelectorAll("a.fr-file")),r=[];for(e=0;e<i.length;e++)r.push(i[e].getAttribute("href"));if(O)for(e=0;e<O.length;e++)r.indexOf(O[e].getAttribute("href"))<0&&t.events.trigger("file.unlink",[O[e]]);O=i}function E(){S(),t.events.on("link.beforeRemove",b),t.$wp&&(C(),t.events.on("contentChanged",C)),y(!0)}var k=2,w=3,x=4,P=5,A=6,F={};F[1]="File cannot be loaded from the passed link.",F[k]="No link in upload response.",F[w]="Error during file upload.",F[x]="Parsing response failed.",F[P]="File is too large.",F[A]="File file type is invalid.",F[7]="Files can be uploaded only to same domain in IE 8 and IE 9.";var O;return{_init:E,showInsertPopup:i,upload:g,insert:s,back:T,hideProgressBar:o}},e.FE.DefineIcon("insertFile",{NAME:"file-o"}),e.FE.RegisterCommand("insertFile",{title:"Upload File",undo:!1,focus:!0,refreshAfterCallback:!1,popup:!0,callback:function(){this.popups.isVisible("file.insert")?(this.$el.find(".fr-marker").length&&(this.events.disableBlur(),this.selection.restore()),this.popups.hide("file.insert")):this.file.showInsertPopup()},plugin:"file"}),e.FE.DefineIcon("fileBack",{NAME:"arrow-left"}),e.FE.RegisterCommand("fileBack",{title:"Back",undo:!1,focus:!1,back:!0,refreshAfterCallback:!1,callback:function(){this.file.back()},refresh:function(e){this.opts.toolbarInline?(e.removeClass("fr-hidden"),e.next(".fr-separator").removeClass("fr-hidden")):(e.addClass("fr-hidden"),e.next(".fr-separator").addClass("fr-hidden"))}}),e.FE.RegisterCommand("fileDismissError",{title:"OK",callback:function(){this.file.hideProgressBar(!0)}})});