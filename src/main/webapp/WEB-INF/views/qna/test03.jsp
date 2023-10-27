<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
:root {
    --btn-width : 30vw;
    --btn-min-width : 10px;
    --btn-height : 15vh;
    --btn-min-height : 5px;
    --menu-height : calc(var(--btn-height) * 4);
    --menu-min-height : calc(var(--btn-min-height) * 2);
    --border-rad : 5px;
    --font-size : 2vw;
}
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    list-style: none;
}
body {
    min-height: 100vh;
    background-color: rgb(238, 238, 238);
    display: flex;
    justify-content: center;
}
#container {
    margin-top: 10vh;
    position: relative;
    display: flex;
    flex-flow: column;
}
#label {
    width: var(--btn-width);
    min-width: var(--btn-min-width);
    height: var(--btn-height);
    min-height: var(--btn-min-height);
    background-color: whitesmoke;
    border-radius: var(--border-rad);
    box-shadow: 0 5px 10px rgba(0,0,0,0.1);
    display: flex;
    justify-content: center;
    align-items: center;
    
}
#arrow{
    width: calc(var(--btn-height) * 0.4);
    height: calc(var(--btn-height) * 0.4);
    border-radius: 100%;
    position: relative;
    transition: 0.3s ease-in-out;
}


#menu {
    width: var(--btn-width);
    min-width: var(--btn-min-width);
    height: 0;
    background-color: whitesmoke;
    border-radius: var(--border-rad);
    box-shadow: 0 5px 10px rgba(0,0,0,0.1);
    position: absolute;
    top: calc(var(--btn-height) + 3vh);
    display: flex;
    flex-flow: column;
    justify-content: space-evenly;
    align-items: center;
    opacity: 0;
    overflow: hidden;
    transition: 0.5s ease-in-out;
}
#toggle:checked ~ #menu{
    height: var(--menu-height);
    min-height: var(--menu-min-height);
    opacity: 1;
}
#toggle:checked ~ #label > #arrow{
    transform: rotate(180deg);
}
.menu-name {
    width: var(--btn-width);
    color: rgb(0, 0, 0);
    text-decoration: none;
    font-size: var(--font-size);
    font-weight: 900;
    line-height: 20px;
}

</style>
</head>
<body>
    <div id="container">
        <input type="checkbox" id="toggle" hidden>
        <label for="toggle" id="label">
            <ion-icon name="chevron-down-outline" id="arrow"></ion-icon>
        </label>
        <ul id="menu">
            <li class="menu-item"><a href="#" class="menu-name">profile</a></li>
            <li class="menu-item"><a href="#" class="menu-name">support</a></li>
            <li class="menu-item"><a href="#" class="menu-name">setting</a></li>
            <li class="menu-item"><a href="#" class="menu-name">inbox</a></li>
        </ul>
    </div>
</body>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>