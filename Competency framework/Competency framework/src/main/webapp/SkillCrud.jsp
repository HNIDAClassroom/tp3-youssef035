<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="ma.ac.esi.referentielCompetences.model.Skill" %>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Ajouter une compétence</title>
 
 <link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <style>
 .container {
 margin-top: 20px;
 }
 #successAlert {
 position: fixed; 
 top: 20%; 
 left: 50%; 
 transform: translateX(-50%); 
 z-index: 1050; 
 display: none; /* Cach�e par d�faut */
 }
 
 </style>
</head>
<body>
 <div class="container">
 <div class="alert alert-success" role="alert" id="successAlert"
style="display: none;">
 <% if (request.getAttribute("message") != null) { %>
 <%= request.getAttribute("message") %>
 <% } %>
 </div>
 <h2>Ajouter une comp�tence</h2>
 <form action="SkillServlet" method="POST">
 <div class="form-group">
 <label for="name">Nom de la comp�tence:</label>
 <input type="text" class="form-control" id="name" name="name"
required>
 </div>
 <div class="form-group">
 <label for="description">Description:</label>
 <textarea class="form-control" id="description" name="description"
rows="3" required></textarea>
 </div>
 <div class="form-group">
 <label for="domain">Domaine:</label>
 <input type="text" class="form-control" id="domain" name="domain"
required>
 </div>
 <div class="form-group">
 <label for="level">Niveau:</label>
 <select class="form-control" id="level" name="level" required>
 <option value="">S�lectionnez un niveau</option>
 <option value="Débutant">Débutant</option>
 <option value="Interm�diaire">Interm�diaire</option>
 <option value="Avanc�">Avanc�</option>
 </select>
 </div>
 <button type="submit" class="btn btn-primary">Ajouter</button>
 </form>
 </div>
 

 
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 <script
src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
 <script
src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
 $(document).ready(function() {
 
 <% if (request.getAttribute("message") != null) { %>
 // Affiche l'alerte
 $('#successAlert').show();
 // Masque l'alerte apr�s 2 secondes (2000 millisecondes)
 setTimeout(function() {
 $('#successAlert').fadeOut('slow');
 }, 2000); // 2 secondes
 <% } %>
 });
 </script>
  <div class="mt-5">
 <h3>Liste des comp�tences</h3>
 <table class="table">
 <thead class="thead-light">
 <tr>
 <th>Nom</th>
 <th>Description</th>
 <th>Domaine</th>
 <th>Niveau</th>
 <th>Actions</th>
 </tr>
 </thead>
 <tbody id="skillsTableBody">
 <% 
  List<Skill> skills = (List<Skill>) request.getAttribute("skillslist");
  if(skills!=null && !skills.isEmpty()){
           for (Skill skill : skills) {%>
            <tr>
                <td><%= skill.getName() %></td>
                <td><%= skill.getDescription() %></td>
                <td><%= skill.getDomain() %></td>
                <td><%= skill.getLevel() %></td>
                <td>
                    <div class="d-flex">
 <a style=" margin-right: 10px; "href="votre_lien_cible.html"
class="btn btn-primary btn-sm" role="button"><i class="fas fa-edit"></i> �diter</a>
 <a href="votre_lien_suppression.html" class="btn btn-danger btn-sm"
role="button"><i class="fas fa-trash-alt"></i> Supprimer</a>
 </div>
                </td>
            </tr>
            <%  } 
} else { %>
    <tr>
        <td colspan="5">Aucune comp�tence disponible.</td>
    </tr>
<% } %>
</tbody>
 </table>
</div>
</body>
</html>