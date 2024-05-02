<?php
include_once($_SERVER['DOCUMENT_ROOT']. '/proj/models/user.php');
// Assuming authentication and user role checks are done
$etudiants = Prof::getAllEtudiants();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prof Dashboard</title>
    <link rel="stylesheet" href="dashboardProf.css">
</head>
<body>
    <div class="container">
        <h1>Prof Dashboard</h1>
        <h2>List des Étudiants</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Email</th>
                    <th>Adresse</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($etudiants as $etudiant): ?>
                <tr>
                    <td><?= htmlspecialchars($etudiant->id) ?></td>
                    <td><?= htmlspecialchars($etudiant->nom) ?></td>
                    <td><?= htmlspecialchars($etudiant->prenom) ?></td>
                    <td><?= htmlspecialchars($etudiant->email) ?></td>
                    <td><?= htmlspecialchars($etudiant->adresse) ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>
</html>