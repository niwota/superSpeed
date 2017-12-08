<footer class="page-footer" style="padding-top:1px;background:#607D8B !important">
	<div class="container">
		{if $links}
		<ul>
			{foreach $links as $link}
				<li style="width:33%;float:left;text-align:center;margin: 5px auto;">
					<a class="btn" href="{$link->link_uri}" target="_blank" style="text-overflow: ellipsis;overflow: hidden;white-space: nowrap;max-width: 95%;padding: 0 1rem;" >{$link->link_name}</a>
				</li>
			{/foreach}
			<div class="clearfix"></div>
		</ul>
		{/if}
	</div>
	<div class="footer-copyright">
		<div class="container">
			<strong>Copyright &copy; {date("Y")} <a href="#">{$config['appName']}</a> </strong>
	    All rights reserved.
		</div>
		<div style="display:none;">
			{$analyticsCode}
		</div>
	</div>
</footer>


<!--  Scripts-->
<script src="/assets/public/js/jquery.min.js"></script>
<script src="/assets/materialize/js/materialize.min.js"></script>
<script src="/assets/materialize/js/init.js"></script>

</body>
</html>
