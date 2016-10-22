//RateApp.js
import React, {Component} from 'react';
import Katayaki from './Katayaki';
import ReactCSSTransitionGroup from 'react-addons-css-transition-group' // ES6

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
      contentType: 'application/json'
    })
    .done(function(data) {
      app.setState({ aspirations: data });
    });
  }


  componentDidMount(){
    this.getAspirations();
  }

  render(){
    let stateCheck = this.state.aspirations

    let katayakie = this.state.aspirations.slice(0,1).map((aspiration,i) => (
        <Katayaki key={String(i)} info={aspiration}/>
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
            transitionEnterTimeout={500}
            transitionLeaveTimeout={300}>
            {katayakie}
          </ReactCSSTransitionGroup>
        </div>

      )
    }
  }
}

export default RateApp;
