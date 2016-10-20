import React from 'react';

const Katayaki = props => {
  var goal = props.info.goal;
  var id = props.info.id;
  var description = props.info.description;
  var user = props.info.user;

  return (
    <div className=>
      <div className="katayaki callout small-4 small-centered columns">
        <h3>{goal}</h3>
        <h4>{description}</h4>
        <h5>{user}</h5>
      </div>
    </div>
  );
};


export default Katayaki;
