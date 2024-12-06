<script>
import "@evidence-dev/tailwind/fonts.css";
import "../app.css";
import { EvidenceDefaultLayout } from "@evidence-dev/core-components";
export let data;
</script>

<svelte:head>
 	
</svelte:head>

<EvidenceDefaultLayout 
	{data} title="Prezență" 
	 
	maxWidth=1800
	fullWidth=true
	hideSidebar=true
	hideTOC
	xhideHeader=true
>
	<slot slot="content" />
</EvidenceDefaultLayout>
