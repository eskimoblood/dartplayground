/**
 * When ever link was clicked a new state will be pushed into the browser history, without loading the side.
 * Also a event will be fired so you can register for a specific url of the app and will be notified when the url was set.
 * The same will happen when the back button was clicked. 
 * No new side is loaded and a event with the path of the url will be fired.
 */

class HistoryManger extends EventBus {

 HistoryManger(){
   document.on.click.add(captureClicks);
   window.on.popState.add((PopStateEvent e)=> _triggerRoute(e));
 }

 void captureClicks(MouseEvent event){
   var srcElement = event.srcElement;
   if(srcElement is AnchorElement){
     event.preventDefault();
     moveTo(srcElement.href);
   }
 }
 
 void moveTo(String url){
   String route =  url.replaceAll(window.location.protocol, '').replaceAll(window.location.host ,'').replaceAll(window.location.port ,'');
   window.history.pushState('{"route":"' + route + '"}', "TEST", url); 
   trigger(route);
 }
 
 void _triggerRoute(PopStateEvent event){
   String state = event.state;
   if(state != null){
     trigger(JSON.parse(state)['route']);
   }
 }
 
}


