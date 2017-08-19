<template>
    <div class="col-xs-12 col-sm-9 col-md-10 ">
        <div class="pull-right margin10">
            <a href="/#/user" class="">go to My pofile to set your own slideshow</a>
        </div>
        <div class="main-content-slide">
            <ul class="rslides">
                <li><img src="/img/1.jpg" alt=""></li>
                <li><img src="/img/2.jpg" alt=""></li>
                <li><img src="/img/3.jpg" alt=""></li>
                <li><img src="/img/4.jpg" alt=""></li>
            </ul>
        </div>
<p>mama</p>
    </div>
</template>

<script src="/js/responsiveslides.min.js">
</script>


<script >
    $(function() {
        $(".rslides").responsiveSlides();
    });

    export default {
        name: 'main',
        data () {
            return {
                msg: 'Welcome to Your Vue.js App'
            }
        }
    }
</script>

<style scoped>

</style>
