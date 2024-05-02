<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="./style.css" />
    <link rel="icon" href="./assets/favicon.ico" type="image/x-icon">
    <title>Plateforme Scolarité</title>
</head>
<body>
    <div class="wrapper">
        <section class="login-container">
            <form id="loginForm" class="login-form">
                <fieldset class="login-fieldset">
                    <legend class="form-title">Register</legend>

                    <div id="failed" class="error-alert" hidden></div>

                    <div class="form-group">
                        <label for="userType">Type de compte:</label>
                        <select id="userType" name="userType" class="form-input">
                            <option value="prof">Prof</option>
                            <option value="etudiant">Etudiant</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="identifiant">Email:</label>
                        <input id="identifiant" type="email" name="identifiant" class="form-input" placeholder="Email" required>
                        <small id="loginError" class="error-message" hidden></small>
                    </div>

                    <div class="form-group">
                        <label for="mdp">Mot de Passe:</label>
                        <input id="mdp" type="password" name="mdp" class="form-input" required>
                        <small id="mdpError" class="error-message" hidden></small>
                    </div>

                    <div class="form-group">
                        <label for="name">Nom:</label>
                        <input id="name" type="text" name="name" class="form-input" required>
                        <small id="NameFieldError" class="error-message" hidden></small>
                    </div>

                    <div class="form-group">
                        <label for="surname">Prenom:</label>
                        <input id="surname" type="text" name="surname" class="form-input" required>
                        <small id="surnameError" class="error-message" hidden></small>
                    </div>

                    <div class="form-group">
                        <label for="address">Adresse:</label>
                        <input id="address" type="text" name="address" class="form-input" required>
                        <small id="addressError" class="error-message" hidden></small>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="submit-btn">Creer un compte</button>
                    </div>
                </fieldset>
            </form>
        </section>
    </div>
    <script src="../scripts/register.js" type="module"></script>
</body>
</html>
