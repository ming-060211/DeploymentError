<script>
    export let data

    // console.log(data.tem)
    // console.log(data.tem2)

</script>

<!--<span>{data.tem}</span>-->
<!--<span>{data.tem2}</span>-->
{#each data.printers as printer}
    <span>{printer.name}</span>
{/each}
