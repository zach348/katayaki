import React from 'react';
import ReactCSSTransitionReplace from 'react-css-transition-replace';

const Katayaki = props => {
  let goal = props.info.goal;
  let id = props.info.id;
  let description = props.info.description;
  let user = props.info.user;
  let endorse = props.endorse;
  let img_url = props.info.img_url
  let next = props.next;
  let btnState = props.btnsDisabled;

    if(img_url == 'default_avatar.png'){
      return (
        <div className='row'>
          <div className='katayaki small-9 small-centered columns'>
            <div className="card">
              <h3>{goal}</h3>
              <h5>{user}</h5>
                <div className='row' key={String(id)}>
                  <button disabled={btnState} className="kat-button" onClick={next}>Skip</button>
                  <button disabled={btnState} className="kat-button" onClick={endorse}>Endorse</button>
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
              <h3>{goal}</h3>
                <div className='row' key={String(id)}>
                  <button disabled={btnState} className="kat-button" onClick={next}>Skip</button>
                  <button disabled={btnState} className="kat-button" onClick={endorse}>Endorse</button>
                </div>
            </div>
          </div>
        </div>
      );
    }
};

export default Katayaki;
