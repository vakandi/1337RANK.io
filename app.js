function getUsers(compus)
{
    var arr = compus == 0 ? ranks : ranksBg;
    Object.keys(arr).forEach(function (rank){
        arr[rank].forEach(function (student)
        {
            var login = student.login;
            var level = student.level;
            var row   =
                `
                <div class="container">
                    <div class="row">
                            <div class="rank"> ${rank} </div>
                            <div class="profile-img">
                              <img class="profile-img" src="./Charts/medium_${login}.jpg" alt="avatar">	  
                            </div>
                            <div class="login" >
                              <div class="login" >${login}</div>
                            </div>
                          <div class="level">${level}</div>
                    </div>
                </div>
                `
            document.body.insertAdjacentHTML('beforeend',row)
            
        })
        
    })
}
