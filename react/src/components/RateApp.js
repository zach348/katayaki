//RateApp.js
import React, {Component} from 'react';
import Katayaki from './Katayaki';
import ReactCSSTransitionReplace from 'react-css-transition-replace';

class RateApp extends Component {
  constructor(props){
    super(props);
    this.state = {
      aspirations: []
    };
    this.getAspirations = this.getAspirations.bind(this);
  }

  getAspirations() {
    let app = this;
    $.ajax({
      method: 'GET',
      url: '/aspirations.json',
      contentType: 'application/json',
      success: function(data) {
        app.setState(
          { aspirations: data}
        );
      }
    });
  }

  disableBtns(){
    this.setState(
      { disabled: true }
    );
  }

  enableBtns(){
    this.setState(
      { disabled: false }
    )
  }

  endorse(id){
    let app = this;
    $.ajax({
      method: 'POST',
      url: '/endorse',
      data: {id: id},
      success: function(data){
        app.getAspirations();
      }
    });
    debugger;
  }

  next(){
    this.getAspirations();
  }

  componentDidMount(){
    this.getAspirations();
  }

  render(){
    let aspiration = this.state.aspirations[0];
;

    if(aspiration === undefined){
      return (
        <div className='small-9 small-centered columns'></div>
      );
    }else{
      let katayaki = <Katayaki key={String(aspiration.id)} endorse={() => this.endorse(aspiration.id)} next={() => this.next()} info={aspiration}/>
      return (
        <ReactCSSTransitionReplace
          transitionName="cross-fade"
          transitionEnterTimeout={5000}
          transitionLeaveTimeout={1000}>
          {katayaki}
        </ReactCSSTransitionReplace>
      )
    }
  }
}

export default RateApp;
