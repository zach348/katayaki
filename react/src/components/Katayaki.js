import React from 'react';

const Katayaki = props => {
  let goal = props.info.goal;
  let id = props.info.id;
  let description = props.info.description;
  let user = props.info.user;
  let handleClick = props.onClick;
  let btnState = props.btnsDisabled;

  return (

    <div className='row'>
      <div className='katayaki small-9 small-centered columns'>
        <div className="card">
          <h3>{goal}</h3>
          <h5>{user}</h5>
          <div className='row'>
            <button disabled={btnState} className="kat-button" onClick={handleClick}>Endorse</button>
            <button className="kat-button" onClick={handleClick}>Next</button>
          </div>
        </div>
      </div>
    </div>

  );
};


export default Katayaki;
