import React from 'react';
import ReactCSSTransitionReplace from 'react-css-transition-replace';

const Katayaki = props => {
  let goal = props.info.goal;
  let id = props.info.id;
  let description = props.info.description;
  let user = props.info.user;
  let details = props.info.details;
  let endorse = props.endorse;
  let img_url = props.info.img_url
  let next = props.next;
  let btnState = props.btnsDisabled;
  let showDef = props.showDef;
  let defDisplayed = props.defDisplayed;

    if(img_url == 'default_avatar.png'){
      if(defDisplayed){
        return (
          <div className='row'>
            <div className='katayaki small-9 small-centered columns'>
              <div className="card">
                <h4>{user}</h4>
                <h3 className='goal-title underline' onClick={showDef}>{goal}</h3>
                <h5>({details})</h5>
                  <div className='row' key={String(id)}>
                    <button disabled={btnState} className="kat-button" onClick={next}>Pass</button>
                    <button disabled={btnState} className="kat-button" onClick={endorse}>Boost</button>
                  </div>
              </div>
            </div>
          </div>
        );
      }else{
        return (
          <div className='row'>
            <div className='katayaki small-9 small-centered columns'>
              <div className="card">
                <h4>{user}</h4>
                <h3 className='goal-title underline' onClick={showDef}>{goal}</h3>
                  <div className='row' key={String(id)}>
                    <button disabled={btnState} className="kat-button" onClick={next}>Pass</button>
                    <button disabled={btnState} className="kat-button" onClick={endorse}>Boost</button>
                  </div>
              </div>
            </div>
          </div>
        );
      }
    }else{
      if(defDisplayed){
        return (
          <div className='row'>
            <div className='katayaki small-9 small-centered columns'>
              <div className="card">
                <img src={img_url} className='prof-img'></img>
                <h3 className='goal-title' onClick={showDef}>{goal}</h3>
                <h5>({details})</h5>
                  <div className='row' key={String(id)}>
                    <button disabled={btnState} className="kat-button" onClick={next}>Pass</button>
                    <button disabled={btnState} className="kat-button" onClick={endorse}>Boost</button>
                  </div>
              </div>
            </div>
          </div>
        );
      }else{
        return (
          <div className='row'>
            <div className='katayaki small-9 small-centered columns'>
              <div className="card">
                <img src={img_url} className='prof-img'></img>
                <h3 className='goal-title' onClick={showDef}>{goal}</h3>
                  <div className='row' key={String(id)}>
                    <button disabled={btnState} className="kat-button" onClick={next}>Pass</button>
                    <button disabled={btnState} className="kat-button" onClick={endorse}>Boost</button>
                  </div>
              </div>
            </div>
          </div>
        );
      }
    }
};

export default Katayaki;
