//RateApp.js
import React, {Component} from 'react';
import Katayaki from './Katayaki';
import ReactCSSTransitionReplace from 'react-css-transition-replace';

class RateApp extends Component {
  constructor(props){
    super(props);
    this.state = {
      aspirations: [],
      disabled: true
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
    this.disableBtns();
    $.ajax({
      method: 'POST',
      url: '/endorse',
      data: {id: id},
      success: function(data){
        app.getAspirations();
      }
    });
    setTimeout(this.enableBtns.bind(this), 3000);
  }

  next(){
    this.disableBtns();
    this.getAspirations();
    setTimeout(this.enableBtns.bind(this), 3000);
  }

  componentDidMount(){
    this.getAspirations();
    setTimeout(this.enableBtns.bind(this), 3000);
  }

  render(){
    let aspiration = this.state.aspirations[0];

    if(aspiration === undefined){
      return (
        <div className='small-9 small-centered columns'></div>
      );
    }else{
      let katayaki = <Katayaki btnsDisabled={this.state.disabled} key={String(aspiration.id)} endorse={() => this.endorse(aspiration.id)} next={() => this.next()} info={aspiration}/>
      return (
        <ReactCSSTransitionReplace
          transitionName="cross-fade"
          transitionEnterTimeout={2000}
          transitionLeaveTimeout={800}>
          {katayaki}
        </ReactCSSTransitionReplace>
      )
    }
  }
}

export default RateApp;
