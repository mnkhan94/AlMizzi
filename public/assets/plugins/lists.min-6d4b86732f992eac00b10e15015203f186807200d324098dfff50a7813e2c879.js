!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):"object"==typeof module&&module.exports?module.exports=function(t,n){return void 0===n&&(n="undefined"!=typeof window?require("jquery"):require("jquery")(t)),e(n)}:e(window.jQuery)}(function(e){e.FE.PLUGINS.lists=function(t){function n(e){return'<span class="fr-open-'+e.toLowerCase()+'"></span>'}function a(e){return'<span class="fr-close-'+e.toLowerCase()+'"></span>'}function r(t,n){for(var a=[],r=0;r<t.length;r++){var i=t[r].parentNode;"LI"==t[r].tagName&&i.tagName!=n&&a.indexOf(i)<0&&a.push(i)}for(r=a.length-1;r>=0;r--){var o=e(a[r]);o.replaceWith("<"+n.toLowerCase()+">"+o.html()+"</"+n.toLowerCase()+">")}}function i(n,a){r(n,a);var i,o=t.html.defaultTag(),l=null;n.length&&(i="rtl"==t.opts.direction||"rtl"==e(n[0]).css("direction")?"margin-right":"margin-left");for(var s=0;s<n.length;s++)if("LI"!=n[s].tagName){var f=t.helpers.getPX(e(n[s]).css(i))||0;n[s].style.marginLeft=null,null===l&&(l=f);var p=l>0?"<"+a+' style="'+i+": "+l+'px;">':"<"+a+">",d="</"+a+">";for(f-=l;f/t.opts.indentMargin>0;)p+="<"+a+">",d+=d,f-=t.opts.indentMargin;o&&n[s].tagName.toLowerCase()==o?e(n[s]).replaceWith(p+"<li"+t.node.attributes(n[s])+">"+e(n[s]).html()+"</li>"+d):e(n[s]).wrap(p+"<li></li>"+d)}t.clean.lists()}function o(r){var i,o;for(i=r.length-1;i>=0;i--)for(o=i-1;o>=0;o--)if(e(r[o]).find(r[i]).length||r[o]==r[i]){r.splice(i,1);break}var l=[];for(i=0;i<r.length;i++){var s=e(r[i]),f=r[i].parentNode,p=s.attr("class");if(s.before(a(f.tagName)),"LI"==f.parentNode.tagName)s.before(a("LI")),s.after(n("LI"));else{var d="";p&&(d+=' class="'+p+'"');var c="rtl"==t.opts.direction||"rtl"==s.css("direction")?"margin-right":"margin-left";t.helpers.getPX(e(f).css(c))&&(d+=' style="'+c+":"+t.helpers.getPX(e(f).css(c))+'px;"'),d&&s.wrapInner("<"+t.html.defaultTag()+d+"></"+t.html.defaultTag()+">"),t.node.isEmpty(s.get(0),!0)||0!==s.find(t.html.blockTagsQuery()).length||s.append("<br>"),s.append(n("LI")),s.prepend(a("LI"))}s.after(n(f.tagName)),"LI"==f.parentNode.tagName&&(f=f.parentNode.parentNode),l.indexOf(f)<0&&l.push(f)}for(i=0;i<l.length;i++){var g=e(l[i]),m=g.html();m=m.replace(/<span class="fr-close-([a-z]*)"><\/span>/g,"</$1>"),m=m.replace(/<span class="fr-open-([a-z]*)"><\/span>/g,"<$1>"),g.replaceWith(t.node.openTagString(g.get(0))+m+t.node.closeTagString(g.get(0)))}t.$el.find("li:empty").remove(),t.$el.find("ul:empty, ol:empty").remove(),t.clean.lists(),t.html.wrap()}function l(e,t){for(var n=!0,a=0;a<e.length;a++){if("LI"!=e[a].tagName)return!1;e[a].parentNode.tagName!=t&&(n=!1)}return n}function s(e){t.selection.save(),t.html.wrap(!0,!0,!0,!0),t.selection.restore();for(var n=t.selection.blocks(),a=0;a<n.length;a++)"LI"!=n[a].tagName&&"LI"==n[a].parentNode.tagName&&(n[a]=n[a].parentNode);t.selection.save(),l(n,e)?o(n):i(n,e),t.html.unwrap(),t.selection.restore()}function f(n,a){var r=e(t.selection.element());if(r.get(0)!=t.el){var i=r.get(0);i="LI"!=i.tagName&&i.firstElementChild&&"LI"!=i.firstElementChild.tagName?r.parents("li").get(0):"LI"==i.tagName||i.firstElementChild?i.firstElementChild&&"LI"==i.firstElementChild.tagName?r.get(0).firstChild:r.get(0):r.parents("li").get(0),i&&i.parentNode.tagName==a&&t.el.contains(i.parentNode)&&n.addClass("fr-active")}}function p(n){t.selection.save();for(var a=0;a<n.length;a++){var r=n[a].previousSibling;if(r){var i=e(n[a]).find("> ul, > ol").last().get(0);if(i){for(var o=e("<li>").prependTo(e(i)),l=t.node.contents(n[a])[0];l&&!t.node.isList(l);){var s=l.nextSibling;o.append(l),l=s}e(r).append(e(i)),e(n[a]).remove()}else{var f=e(r).find("> ul, > ol").last().get(0);if(f)e(f).append(e(n[a]));else{var p=e("<"+n[a].parentNode.tagName+">");e(r).append(p),p.append(e(n[a]))}}}}t.clean.lists(),t.selection.restore()}function d(e){t.selection.save(),o(e),t.selection.restore()}function c(e){if("indent"==e||"outdent"==e){for(var n=!1,a=t.selection.blocks(),r=[],i=0;i<a.length;i++)"LI"==a[i].tagName?(n=!0,r.push(a[i])):"LI"==a[i].parentNode.tagName&&(n=!0,r.push(a[i].parentNode));n&&("indent"==e?p(r):d(r))}}function g(){t.events.on("commands.after",c),t.events.on("keydown",function(n){if(n.which==e.FE.KEYCODE.TAB){for(var a=t.selection.blocks(),r=[],i=0;i<a.length;i++)"LI"==a[i].tagName?r.push(a[i]):"LI"==a[i].parentNode.tagName&&r.push(a[i].parentNode);if(r.length>1||r.length&&(t.selection.info(r[0]).atStart||t.node.isEmpty(r[0])))return n.preventDefault(),n.stopPropagation(),n.shiftKey?d(r):p(r),!1}},!0)}return{_init:g,format:s,refresh:f}},e.FE.RegisterCommand("formatUL",{title:"Unordered List",refresh:function(e){this.lists.refresh(e,"UL")},callback:function(){this.lists.format("UL")},plugin:"lists"}),e.FE.RegisterCommand("formatOL",{title:"Ordered List",refresh:function(e){this.lists.refresh(e,"OL")},callback:function(){this.lists.format("OL")},plugin:"lists"}),e.FE.DefineIcon("formatUL",{NAME:"list-ul"}),e.FE.DefineIcon("formatOL",{NAME:"list-ol"})});