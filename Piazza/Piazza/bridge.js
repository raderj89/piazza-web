 (() => {
     class Adapater {
         receive(message) {
             window.webkit.messageHandlers.nativeApp.postMessage(message)
         }
     }
     window.webBridge.adapter = new Adapter()
 })()
