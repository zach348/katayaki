//RateApp.js
import React, {Component} from 'react';
import Katayaki from './Katayaki';


class RateApp extends Component {
  constructor(props){
    super(props);
    this.state = {

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
    return (
      <h1>Hello</h1>
    );
  }
}

export default RateApp;
