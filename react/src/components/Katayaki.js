import React from 'react';

const Katayaki = props => {
  var goal = props.info.goal;
  var id = props.info.id;
  var description = props.info.description;
  var user = props.info.user;
  var handleClick = props.onClick;

  return (

    <div className='row'>
      <div className='katayaki small-9 small-centered columns'>
        <div className="card" onClick={handleClick}>
          <h3>{goal}</h3>
          <h5>{user}</h5>
        </div>
      </div>
    </div>

  );
};


export default Katayaki;
