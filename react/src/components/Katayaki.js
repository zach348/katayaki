import React from 'react';
import ReactCSSTransitionReplace from 'react-css-transition-replace';

const Katayaki = props => {
  let goal = props.info.goal;
  let id = props.info.id;
  let description = props.info.description;
  let user = props.info.user;
  let endorse = props.endorse;
  let next = props.next;
  let btnState = props.btnsDisabled;

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
};

export default Katayaki;
