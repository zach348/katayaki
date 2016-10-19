//RateApp.js
import React, {Component} from 'react';


class RateApp extends Component {
  constructor(props){
    super(props);
    this.state = {
      'key': 'hello'
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
    setTimeout(this.getAspirations, 3000);
  }




  render(){
    return (
      <h1>Hello</h1>
    );
  }
}

export default RateApp;
