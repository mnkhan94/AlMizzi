!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):"object"==typeof module&&module.exports?module.exports=function(n,t){return void 0===t&&(t="undefined"!=typeof window?require("jquery"):require("jquery")(n)),e(t)}:e(window.jQuery)}(function(e){e.FE.URLRegEx="(^| |\\u00A0)("+e.FE.LinkRegEx+"|([a-z0-9+-_.]{1,}@[a-z0-9+-_.]{1,}))$",e.FE.PLUGINS.url=function(n){function t(t,o,r){var i=r;return n.opts.linkConvertEmailAddress&&e.FE.MAIL_REGEX.test(i)&&!/^mailto:.*/i.test(i)&&(i="mailto:"+i),/^((http|https|ftp|ftps|mailto|tel|sms|notes|data)\:)/i.test(i)||(i="//"+i),(o||"")+"<a"+(n.opts.linkAlwaysBlank?' target="_blank"':"")+(u?' rel="'+u+'"':"")+' href="'+i+'">'+r+"</a>"}function o(){return new RegExp(e.FE.URLRegEx,"gi")}function r(e){return n.opts.linkAlwaysNoFollow&&(u="nofollow"),n.opts.linkAlwaysBlank&&(u?u+=" noopener noreferrer":u="noopener noreferrer"),e.replace(o(),t)}function i(e){return!!e&&("A"===e.tagName||!(!e.parentNode||e.parentNode==n.el)&&i(e.parentNode))}function a(){var t=n.selection.ranges(0),a=t.startContainer;if(!a||a.nodeType!==Node.TEXT_NODE)return!1;if(i(a))return!1;if(o().test(a.textContent))e(a).before(r(a.textContent)),a.parentNode.removeChild(a);else if(a.previousSibling&&"A"===a.previousSibling.tagName){var l=a.previousSibling.innerText+a.textContent;o().test(l)&&(e(a.previousSibling).replaceWith(r(l)),a.parentNode.removeChild(a))}}function l(){n.events.on("paste.afterCleanup",function(n){if(new RegExp(e.FE.URLRegEx,"gi").test(n))return r(n)}),n.events.on("keydown",function(t){var o=t.which;!n.selection.isCollapsed()||o!=e.FE.KEYCODE.ENTER&&o!=e.FE.KEYCODE.SPACE&&o!=e.FE.KEYCODE.PERIOD||a()},!0)}var u=null;return{_init:l}}});