"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[840],{3905:(e,t,r)=>{r.d(t,{Zo:()=>s,kt:()=>m});var a=r(67294);function n(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function o(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,a)}return r}function i(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?o(Object(r),!0).forEach((function(t){n(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):o(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function l(e,t){if(null==e)return{};var r,a,n=function(e,t){if(null==e)return{};var r,a,n={},o=Object.keys(e);for(a=0;a<o.length;a++)r=o[a],t.indexOf(r)>=0||(n[r]=e[r]);return n}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(a=0;a<o.length;a++)r=o[a],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(n[r]=e[r])}return n}var c=a.createContext({}),p=function(e){var t=a.useContext(c),r=t;return e&&(r="function"==typeof e?e(t):i(i({},t),e)),r},s=function(e){var t=p(e.components);return a.createElement(c.Provider,{value:t},e.children)},u="mdxType",d={inlineCode:"code",wrapper:function(e){var t=e.children;return a.createElement(a.Fragment,{},t)}},g=a.forwardRef((function(e,t){var r=e.components,n=e.mdxType,o=e.originalType,c=e.parentName,s=l(e,["components","mdxType","originalType","parentName"]),u=p(r),g=n,m=u["".concat(c,".").concat(g)]||u[g]||d[g]||o;return r?a.createElement(m,i(i({ref:t},s),{},{components:r})):a.createElement(m,i({ref:t},s))}));function m(e,t){var r=arguments,n=t&&t.mdxType;if("string"==typeof e||n){var o=r.length,i=new Array(o);i[0]=g;var l={};for(var c in t)hasOwnProperty.call(t,c)&&(l[c]=t[c]);l.originalType=e,l[u]="string"==typeof e?e:n,i[1]=l;for(var p=2;p<o;p++)i[p]=r[p];return a.createElement.apply(null,i)}return a.createElement.apply(null,r)}g.displayName="MDXCreateElement"},64925:(e,t,r)=>{r.r(t),r.d(t,{assets:()=>c,contentTitle:()=>i,default:()=>d,frontMatter:()=>o,metadata:()=>l,toc:()=>p});var a=r(87462),n=(r(67294),r(3905));const o={sidebar_position:2},i="Getting Started",l={unversionedId:"gettingStarted",id:"gettingStarted",title:"Getting Started",description:"To get started using the Draggable module, follow these simple steps:",source:"@site/docs/gettingStarted.md",sourceDirName:".",slug:"/gettingStarted",permalink:"/draggable/docs/gettingStarted",draft:!1,editUrl:"https://github.com/DestinEcarma/draggable/edit/master/docs/gettingStarted.md",tags:[],version:"current",sidebarPosition:2,frontMatter:{sidebar_position:2},sidebar:"defaultSidebar",previous:{title:"About",permalink:"/draggable/docs/intro"},next:{title:"Installation",permalink:"/draggable/docs/installation"}},c={},p=[],s={toc:p},u="wrapper";function d(e){let{components:t,...r}=e;return(0,n.kt)(u,(0,a.Z)({},s,r,{components:t,mdxType:"MDXLayout"}),(0,n.kt)("h1",{id:"getting-started"},"Getting Started"),(0,n.kt)("p",null,"To get started using the Draggable module, follow these simple steps:"),(0,n.kt)("ol",null,(0,n.kt)("li",{parentName:"ol"},(0,n.kt)("p",{parentName:"li"},"We first need to require the module:"),(0,n.kt)("pre",{parentName:"li"},(0,n.kt)("code",{parentName:"pre",className:"language-lua"},"local Draggable = require(--[[ Path ]]) -- Example game.ReplciatedStorage.Draggable\n"))),(0,n.kt)("li",{parentName:"ol"},(0,n.kt)("p",{parentName:"li"},"Create a Draggable Class for your GuiObject:"),(0,n.kt)("pre",{parentName:"li"},(0,n.kt)("code",{parentName:"pre",className:"language-lua"},"local myFrame = script.Parent.Frame\n\nlocal draggableObject = Draggable.new(myFrame)\n")),(0,n.kt)("admonition",{parentName:"li",title:"important",type:"important"},(0,n.kt)("p",{parentName:"admonition"},"Make sure that the GuiObject's ",(0,n.kt)("a",{parentName:"p",href:"https://create.roblox.com/docs/reference/engine/classes/GuiObject#Interactable"},"Interactable")," is set to ",(0,n.kt)("inlineCode",{parentName:"p"},"true"),"."),(0,n.kt)("p",{parentName:"admonition"},"The Draggable module does not work with any ",(0,n.kt)("a",{parentName:"p",href:"https://create.roblox.com/docs/reference/engine/classes/GuiButton"},"GuiButton"),".")),(0,n.kt)("admonition",{parentName:"li",type:"tip"},(0,n.kt)("p",{parentName:"admonition"},"If the Draggable's GuiObject is being obstructed by a GuiObject")))),(0,n.kt)("p",null,"Now your GuiObject is draggable! Once you have decided to stop the dragging capability, simply call the ",(0,n.kt)("a",{parentName:"p",href:"../api/Draggable#Destroy"},(0,n.kt)("inlineCode",{parentName:"a"},"Destroy"))," method on the class."))}d.isMDXComponent=!0}}]);