//RateApp.js
import React, {Component} from 'react';


class RateApp extends Component {
  constructor(props){
    super(props);
    this.state = {

    };

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

  render(){
    return (
      <h1> Test </h1>
    );
  }
}

export default RateApp;
