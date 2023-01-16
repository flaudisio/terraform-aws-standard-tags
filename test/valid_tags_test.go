package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

func TestValidTags(t *testing.T) {
	t.Parallel()

	workingDir := "../examples/valid-tags"

	stage := test_structure.RunTestStage

	defer stage(t, "cleanup", func() {
		terraformOptions := test_structure.LoadTerraformOptions(t, workingDir)

		terraform.Destroy(t, terraformOptions)
	})

	stage(t, "init", func() {
		terraformOptions := &terraform.Options{
			TerraformDir: workingDir,
		}

		test_structure.SaveTerraformOptions(t, workingDir, terraformOptions)

		terraform.Init(t, terraformOptions)
	})

	stage(t, "deploy", func() {
		terraformOptions := test_structure.LoadTerraformOptions(t, workingDir)

		terraform.Plan(t, terraformOptions)
		terraform.ApplyAndIdempotent(t, terraformOptions)
	})

	stage(t, "validate", func() {
		terraformOptions := test_structure.LoadTerraformOptions(t, workingDir)

		tags := terraform.OutputMap(t, terraformOptions, "tags")

		assert.Contains(t, tags, "created-by", "The 'tags' output does not contain the 'created-by' tag.")
		assert.Contains(t, tags, "environment", "The 'tags' output does not contain the 'environment' tag.")
		assert.Contains(t, tags, "owner", "The 'tags' output does not contain the 'owner' tag.")
		assert.Contains(t, tags, "service", "The 'tags' output does not contain the 'service' tag.")
	})
}
