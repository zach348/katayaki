//RateApp.js
import React, {Component} from 'react';
import Katayaki from './Katayaki';
import ReactCSSTransitionReplace from 'react-css-transition-replace';

class RateApp extends Component {
  constructor(props){
    super(props);
    this.state = {
      aspirations: [],
      disabled: false,
      defDisplayed: false
    };
    this.getAspirations = this.getAspirations.bind(this);
    this.showDef = this.showDef.bind(this);
  }

  getAspirations() {
    let app = this;
    $.ajax({
      method: 'GET',
      url: '/aspirations.json',
      contentType: 'application/json',
      success: function(data) {
        app.setState(
          { aspirations: data }
        );
      }
    });
  }

  showDef(){
    if(this.state.defDisplayed){
      this.setState(
        { defDisplayed: false }
      );
    }else{
      this.setState(
        { defDisplayed: true }
      );
    }
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
      data: {rating: { aspiration_id: id } },
      success: function(data){
        app.disableBtns();
        app.getAspirations();
        setTimeout(app.enableBtns.bind(app), 2200);
      }
    });
  }

  next(){
    this.disableBtns();
    this.getAspirations();
    setTimeout(this.enableBtns.bind(this), 2200);
  }

  componentDidMount(){
    this.getAspirations();
    setTimeout(this.enableBtns.bind(this), 2200);
  }

  render(){
    let aspiration = this.state.aspirations[0];

    if(aspiration == undefined){
      return (
        <div className='small-9 small-centered columns'>EMPTY</div>
      )
    }

    let katayaki = <Katayaki btnsDisabled={this.state.disabled}
                    key={String(aspiration.id)}
                    endorse={() => this.endorse(aspiration.id)}
                    next={() => this.next()}
                    showDef={() => this.showDef()}
                    defDisplayed={this.state.defDisplayed}
                    info={aspiration}
                    />
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

export default RateApp;
