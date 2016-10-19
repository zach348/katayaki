//RateApp.js
import React, {Component} from 'react';
import Katayaki from './Katayaki';


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
      debugger;
      app.setState({ aspirations: data });
    });
  }


  componentDidMount(){
    this.getAspirations();
  }




  render(){
    var aspiration = this.state.aspirations.pop();

    if(aspiration === undefined){
      return (
        <div></div>
      );
    }else{
      return (
        <div>
          <h1>text</h1>
          <Katayaki info={aspiration}/>
        </div>

      );
    }
  }
}

export default RateApp;
