# frozen_string_literal: true

module HomeHelper 
  def sorting_link()
    "<h1 class='text-dark'>Title</h1>".html_safe
  end

  def navigate_to_categories()
    "<h1 class='responsive-h1 black-text text-uppercase font-weight-bold'>
      <strong>Everything you need</strong>
    </h1>
    <hr class='hr-dark my-4 wow' data-wow-delay='0.4s'></hr>
    <div class='inline'>
      <h5 class='text-uppercase mb-4 white-text wow fadeInDown' data-wow-delay='0.4s'>
        <a class='btn btn-outline-dark text-uppercase white-text' href=#{@women}>
          Women
        </a>
        <a class='btn btn-outline-dark text-uppercase white-text' href=#{@men}>
          Men
        </a>        
      </h5> 
    </div>".html_safe
  end
end

