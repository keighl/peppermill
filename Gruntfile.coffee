module.exports = (grunt) ->


  grunt.initConfig

    pkg: grunt.file.readJSON('package.json')

    emberTemplates:
      options:
        templateName: (name) ->
          name.replace 'handlebars/', ''
      compile:
        files:
          "app/assets/javascripts/peppermill/templates.js": "handlebars/**/*.hbs"

    watch:
      app:
        files: ['handlebars/**/*.hbs']
        tasks: ['emberTemplates']
        options:
          debounceDelay: 100

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-ember-templates'
  grunt.loadNpmTasks 'grunt-ember-handlebars'

  grunt.registerTask('default', ['emberTemplates', 'watch'])
  return