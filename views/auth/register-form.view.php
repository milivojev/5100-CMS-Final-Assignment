<?php get_form_header() ?>


                <form action="/register" method="post" class="form-horizontal">

                    <div class="form-group">
                        <label class="control-label col-sm-5" for="name">name:</label>
                        <div class="col-sm-7">
                            <input type="text" name="name" class="form-control" id="name" placeholder="Enter name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-5" for="email">email:</label>
                        <div class="col-sm-7">
                            <input type="text" name="email" class="form-control" id="email" placeholder="Enter email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-5" for="pwd">Password:</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password">
                        </div>
                    </div>
                    <div>

                        <button class="btn btn-info btn-block">Register</button>

                    </div>
                </form>



<?php get_form_footer() ?>
