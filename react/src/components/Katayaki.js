import React from 'react';
import ReactCSSTransitionReplace from 'react-css-transition-replace';

const Katayaki = props => {
  let goal = props.info.goal;
  let id = props.info.id;
  let description = props.info.description;
  let user = props.info.user;
  let details = props.info.details;
  let endorse = props.endorse;
  let img_url = props.info.img_url == 'default_avatar.png' ? "https://s3.amazonaws.com/katayaki-avatars/anon.png" : props.info.img_url;
  let next = props.next;
  let btnClass = props.btnsDisabled ? "kat-button disabled" : "kat-button";
  let btnState = props.btnsDisabled;
  let showDef = props.showDef;
  let defDisplayed = props.defDisplayed;

    if(props.info.img_url == 'default_avatar.png'){
      if(defDisplayed){
        return (
          <div className='row'>
            <div className='katayaki small-9 small-centered large-7 large-centered columns'>
              <div className="card">
                <img src={img_url} className='prof-img'></img>
                <h4>({user})</h4>
                <h3 className='goal-title underline' onClick={showDef}>{goal}</h3>
                <h5 className='kat-def'>{details}</h5>
                  <div className='row' key={String(id)}>
                    <a href='#' id='pass-button' className={btnClass} onClick={next}>
                      <i className="btn-icon fa fa-circle-o" aria-hidden="true"></i>
                    </a>
                    <a href='#' id='endorse-button' className={btnClass} onClick={endorse}>
                      <i className="btn-icon fa fa-circle" aria-hidden="true"></i>
                    </a>
                  </div>
              </div>
            </div>
          </div>
        );
      }else{
        return (
          <div className='row'>
            <div className='katayaki small-9 small-centered large-7 large-centered columns'>
              <div className="card">
                <img src={img_url} className='prof-img'></img>
                <h4>({user})</h4>
                <h3 className='goal-title underline' onClick={showDef}>{goal}</h3>
                  <div className='row' key={String(id)}>
                    <a href='#' id='pass-button' className={btnClass} onClick={next}>
                      <i className="btn-icon fa fa-circle-o" aria-hidden="true"></i>
                    </a>
                    <a href='#' id='endorse-button' className={btnClass} onClick={endorse}>
                      <i className="btn-icon fa fa-circle" aria-hidden="true"></i>
                    </a>
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
            <div className='katayaki small-9 small-centered large-7 large-centered columns'>
              <div className="card">
                <img src={img_url} className='prof-img'></img>
                <h3 className='goal-title underline' onClick={showDef}>{goal}</h3>
                <h5 className='kat-def'>{details}</h5>
                  <div className='row' key={String(id)}>
                    <a href='#' id='pass-button' className={btnClass} onClick={next}>
                      <i className="btn-icon fa fa-circle-o" aria-hidden="true"></i>
                    </a>
                    <a href='#' id='endorse-button' className={btnClass} onClick={endorse}>
                      <i className="btn-icon fa fa-circle" aria-hidden="true"></i>
                    </a>
                  </div>
              </div>
            </div>
          </div>
        );
      }else{
        return (
          <div className='row'>
            <div className='katayaki small-9 small-centered large-7 large-centered columns'>
              <div className="card">
                <img src={img_url} className='prof-img'></img>
                <h3 className='goal-title underline' onClick={showDef}>{goal}</h3>
                  <div className='row' key={String(id)}>
                    <a href='#' id='pass-button' className={btnClass} onClick={next}>
                      <i className="btn-icon fa fa-circle-o" aria-hidden="true"></i>
                    </a>
                    <a href='#' id='endorse-button' className={btnClass} onClick={endorse}>
                      <i className="btn-icon fa fa-circle" aria-hidden="true"></i>
                    </a>
                  </div>
              </div>
            </div>
          </div>
        );
      }
    }
};

export default Katayaki;
