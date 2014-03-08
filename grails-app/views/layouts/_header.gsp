<header>
	<div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
          <div class="container">
            <a href="${createLink(uri: '/')}" class="brand brand-bootbus"><img src="${resource(dir: 'img', file: 'KLINIKA LOGO.png')}"></a>
            <!-- Below button used for responsive navigation -->
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <!-- Start: Primary navigation -->
            <div class="nav-collapse collapse">
<%--            for All Users--%>
            <sec:ifNotLoggedIn><g:render template="/_menu/signIn"/></sec:ifNotLoggedIn>
            
<%--			for Normal Users--%>
			<sec:ifNotGranted roles="ROLE_ADMIN"><sec:ifAllGranted roles="ROLE_USER">
			<g:render template="/_menu/normalUser"/>
			</sec:ifAllGranted></sec:ifNotGranted>
			
<%--			for Administrator--%>
			<sec:ifAllGranted roles="ROLE_ADMIN" ><g:render template="/_menu/administrator"/></sec:ifAllGranted>
					
            </div>
          </div>
        </div>
      </div>
</header>
