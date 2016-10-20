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
      app.setState({ aspirations: data });
    });
  }


  componentDidMount(){
    this.getAspirations();
    if(this.state.aspirations.length < 3){
      this.getAspirations();
    }
  }




  render(){
    var aspiration = this.state.aspirations.pop();

    if(aspiration === undefined){
      return (
        <div className='katayaki small-9 small-centered columns'></div>
      );
    }else{
      return (
        <div className='row'>
            <div className='katayaki small-9 small-centered columns'>
              <Katayaki info={aspiration}/>
            </div>
        </div>
      )
    }
  }
}

export default RateApp;
