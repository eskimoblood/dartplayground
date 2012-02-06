/**
 * The class is responsible for a specific area in the app.
 * You can bind a presenter to a specific url and whenever the url is set 
 * the presenters start method is called passing the Element presenting the area this mapper is responsible for.
 * The presenter then can render itself into the passed element.
 */

class ActivityMapper {
  Element _container;
  HistoryManger _historyManager;
  
  ActivityMapper(this._historyManager, this._container){}
  
  bindRoute(String route, AbstractPresenter presenter){
    _historyManager.bind(route, ()=>presenter.start(_container));
  }
  
}