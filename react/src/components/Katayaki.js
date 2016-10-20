import React from 'react';

const Katayaki = props => {
  var goal = props.info.goal;
  var id = props.info.id;
  var description = props.info.description;
  var user = props.info.user;

  return (
    <div className="card">
      <h3>{goal}</h3>
      <h5>{user}</h5>
    </div>
  );
};


export default Katayaki;
