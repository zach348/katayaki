//RateApp.js
import React, {Component} from 'react';
import Katayaki from './Katayaki';
import ReactCSSTransitionGroup from 'react-addons-css-transition-group' // ES6

class RateApp extends Component {
  constructor(props){
    super(props);
    this.state = {
      aspirations: [],
      disabled: false
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
  }

  componentDidMount(){
    this.getAspirations();
  }

  render(){
    let stateCheck = this.state.aspirations

    let katayaki = this.state.aspirations.slice(0,1).map((aspiration,i) => (
        <Katayaki key={String(i)} onClick={()=> this.endorse(aspiration.id)} info={aspiration} btnsDisabled={this.state.disabled}/>
    ));

    if(stateCheck === undefined){
      return (
        <div className='small-9 small-centered columns'></div>
      );
    }else{
      return (
        <div>
          <ReactCSSTransitionGroup
            transitionName="example-appear"
            transitionEnterTimeout={2000}
            transitionLeaveTimeout={2000}>
            {katayaki}
          </ReactCSSTransitionGroup>
        </div>

      )
    }
  }
}

export default RateApp;
